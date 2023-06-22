class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f642397de3b43e76c0ad97d5fc8d700d7158e4a932dd60136e5aa11388a589b6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5d534ee59628e2487255ef5a15e5a2079461e9647a804ab71388413800569743" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5d0198e9ed37051daa2a6a4ab0f6a290342695d210b7d246580b24a2c0592079" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3747+7b5bd3a93.tar.xz"
  version "0.11.0-dev.3747+7b5bd3a93"
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
