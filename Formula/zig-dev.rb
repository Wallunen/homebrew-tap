class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "080141812ae4629174c1570d70765023732b640c1a490a1676f75d0bc372609e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2597fed4f27c95c6ea300b008b63cd47a07b8f7f45d6dc47a508ca6ab52a6d09" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d937c9cb828dcdf22814840610e8d3069322278c553b93add5890daa6c93a199" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4004+a57608217.tar.xz"
  version "0.11.0-dev.4004+a57608217"
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
