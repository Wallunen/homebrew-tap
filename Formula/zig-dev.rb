class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "78dfa760d8e2a5107c51de7b257d35f4f0e697ce1d889894349c105b06c360c4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "237a2f954e6f2b00ebb791f3f35d5f5fe30218bdbc8cd63526be0a7df2267f86" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "408bba879c940cbadc133918c237e936a15ee1b81c6f7c6a0a20be95eacab2b3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2835+256c5934b.tar.xz"
  version "0.12.0-dev.2835+256c5934b"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
